require "mgmt"
require "thor"
require "fog"

class Mgmt::CLI < Thor
  class_option :verbose, type: :boolean, aliases: "-v", desc: "Increase verbosity."

  desc "create [NAME] [EMAIL]", "Create a new user"
  def create(name, email)
    begin
      response = client.create_user(email, name)
      say(JSON.generate(response.body)) if options[:verbose]
    rescue Fog::RiakCS::Provisioning::UserAlreadyExists => e
      error("User already exists.")
      exit(1)
    end
  end

  desc "list", "List the users in the system"
  def list
    response  = client.list_users
    headers   = response.body.first.keys
    users     = response.body.map(&:values)
    print_table([ headers, *users ])
  end

  private

  def client
    Fog::RiakCS::Provisioning.new(
      riakcs_access_key_id: options["access_key"],
      riakcs_secret_access_key: options["secret_key"],
      host: options["site"],
      port: 80,
      connection_options: {
        proxy: "http://" + options["site"] + ":80"
      }
    )
  end

  def options
    original_options = super
    default_options  = {
      "access_key" => ENV["RIAKCS_ACCESS_KEY_ID"],
      "secret_key" => ENV["RIAKCS_SECRET_ACCESS_KEY"],
      "site" => ENV["RIAKCS_SITE"]
    }

    if default_options["access_key"].nil? && default_options["secret_key"].nil? && default_options["site"].nil?
      error("Please set your RIAKCS_ACCESS_KEY_ID and RIAKCS_SECRET_ACCESS_KEY and RIAKCS_SITE enviromental variables.")
      exit(1)
    end

    Thor::CoreExt::HashWithIndifferentAccess.new(original_options.merge(default_options))
  end
end
