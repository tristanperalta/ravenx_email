# ravenx_email

[![Current Version](https://img.shields.io/hexpm/v/ravenx_email.svg)](https://hex.pm/packages/ravenx_email)
[![Build Status](https://travis-ci.org/acutario/ravenx_email.svg?branch=master)](https://travis-ci.org/acutario/ravenx_email)

Ravenx strategy to send e-mail notifications

## Installation

The package can be installed as simply as adding `ravenx` and `ravenx_email` to your list of dependencies in `mix.exs`:

```elixir
  def deps do
    [
      {:ravenx, "~> 2.0"},
      {:ravenx_email, "~> 0.1"}
    ]
  end
```

## Configuration

To enable this strategy, just specify it in your `ravenx` configuration:

```elixir
config :ravenx,
  strategies: [
    email: Ravenx.Strategy.Email
  ]
```

### Available configuration

The strategy can be configured as mentioned on the
[Ravenx's README](https://github.com/acutario/ravenx/blob/master/README.md),
been able to configure the following variables:

- **adapter**: the adapter to use See more information on the **Adapters** section.
- **from**: The default address from which the emails are sent. It can be an email address or a tuple `{"Name", "email@address.com"}`.
- **to**: The default addresses to which the emails are sent. It can be an email address, a tuple `{"Name", "email@address.com"}`, or a list of strings/tuples.
- **cc**: The default addresses to which the emails are sent in CC mode. It can be an email address, a tuple `{"Name", "email@address.com"}`, or a list of strings/tuples.
- **bcc**: The default addresses to which the emails are sent in BCC mode. It can be an email address, a tuple `{"Name", "email@address.com"}`, or a list of strings/tuples.
- **subject**: The default subject for the emails.

## Adapters

By default the strategy comes with this adapters:

- `:mailgun`: Official Mailgun adapter from Bamboo
- `:mandrill`: Official Mandrill adapter from Bamboo
- `:sendgrid`: Official Sendgrid adapter from Bamboo
- `:smtp`: Official SMTP adapter from Bamboo
- `:local`: Local email adapter from Bamboo. Doesn't really send the the e-mails.
- `:test`: Test email adapter from Bamboo. Doesn't really send the the e-mails.

These adapter can accept configuration, which have to be added to the strategy
configuration or the options passed when calling Ravenx.

To see the list of configuration options available, please refer to Bamboo
documentation on each adapter.

Additional adapters can be added (always following the Bmaboo conventions) by
adding them to the configuration like:

```elixir
config :ravenx,
  bamboo_adapters: [
    my_adapter: MyApp.Email.Adapter
  ]
```

## Payload

The full list of available fields are:

- **to**: in the same format than the configuration.
- **from**: in the same format than the configuration.
- **bcc**: in the same format than the configuration.
- **cc**: in the same format than the configuration.
- **subject**: in the same format than the configuration.
- **text_body**: text version of the payload for non-HTML clients.
- **html_body**: HTML version of the body.

### Preference of configuration

As you may notice, there are configuration that can be on the payload, on the
configuration passed or in the configuration of the strategy.

Well, the configuration passed in the `options` when calling Ravenx will
override the default configuration of the strategy. But if you pass
configuration on the payload, it will override any other configuration
previously set.

## Contribute

All contributions are welcome, and we really hope this repo will serve for beginners as well for more advanced developers.

If you have any doubt, feel free to ask, but always respecting our [Code of Conduct](https://github.com/acutario/ravenx_slack/blob/master/CODE_OF_CONDUCT.md).

To contribute, create a fork of the repository, make your changes and create a PR. And remember, talking on PRs/issues is a must!

