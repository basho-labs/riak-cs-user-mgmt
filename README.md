# riak-cs-user-mgmt

`mgmt` is a command-line tool that aids in [Riak
CS](https://github.com/basho/riak_cs) user management.

## Installation

```bash
$ git clone git://github.com/hectcastro/riak-cs-user-mgmt.git
$ cd riak-cs-user-mgmt
$ rake install
```

## Usage

```bash
$ mgmt list
email  display_name  name  key_id  key_secret  id  status
...
$ mgmt create -v test3 test3@example.com
{"email":"test3@example.com","display_name":"test3","name":"test3","key_id":"LLBMUDS0KC7D3VRV6PZS","key_secret":"NJKY-7bNU9d7G_EioIMj1UIV4qmM7Ov8ryhK1w==","id":"1270290a292867033583634dcf195d6387886e54cf91a1833fa6750b45ff72bd","status":"enabled"}
```

## Testing

The test suite for `riak-cs-user-mgmt` was built using
[Cucumber](https://github.com/cucumber/cucumber) and
[Aruba](https://github.com/cucumber/aruba). In order to run the tests, you'll
need an active instnace of Riak.

```bash
$ cucumber features/
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
