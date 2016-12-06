# Nww-Devtools

Here at [Nix-wie-weg<sup>®</sup>](http://technik.nix-wie-weg.de/) we use some
common supporting gems and configuration for our Ruby projects.
We document the actual list here.

## Pry

* [pry](http://pryrepl.org/)
* [pry-doc](https://github.com/banister/pry-doc)
* [pry-byebug](https://github.com/deivid-rodriguez/pry-byebug)
* [pry-remote](https://github.com/Mon-Ouie/pry-remote)
* [pry-theme](https://github.com/kyrylo/pry-theme)
* [awesome_print](https://github.com/michaeldv/awesome_print)

### Gemfile

```
gem 'pry', require: false
gem 'pry-doc', require: false
gem 'pry-byebug', require: false
gem 'pry-remote', require: false
gem 'pry-theme', require: false
gem 'awesome_print', require: false
```

## Rails

* [better_errors](https://github.com/charliesome/better_errors)
* [binding_of_caller](https://github.com/banister/binding_of_caller)
* [require_reloader](https://github.com/teohm/require_reloader)

### Gemfile

```
gem 'better_errors'
gem 'binding_of_caller'
gem 'require_reloader'
```

### Initializer

```
BetterErrors::Middleware.allow_ip! '10.1.0.0/16' if Rails.env.development?
```

## RuboCop

### Gemfile

```
gem 'rubocop', '~> 0.39.0'
```

We agreed on the cops of the specific version 0.39.

### .rubocop.yml

(In project directory)

```
AllCops:
  TargetRubyVersion: 2.2
  Exclude:
    - 'vendor/bundle/**/*'
  DisplayCopNames: true
Rails:
  Enabled: true
Style/Encoding:
  EnforcedStyle: when_needed
  Enabled: true
Style/AsciiComments:
  Enabled: false
Style/Documentation:
  Enabled: false
Metrics/MethodLength:
  Enabled: false
Style/MethodDefParentheses:
  Enabled: false
Style/MultilineOperationIndentation:
  EnforcedStyle: aligned
Style/MultilineMethodCallIndentation:
  EnforcedStyle: indented
Style/MultilineMethodDefinitionBraceLayout:
  Enabled: true
Style/MultilineHashBraceLayout:
  Enabled: true
Style/SignalException:
  Enabled: false
Metrics/ClassLength:
  Enabled: false
Lint/AssignmentInCondition:
  Enabled: false
Metrics/ParameterLists:
  Enabled: false
Style/MultilineBlockChain:
  Enabled: false
Style/CommentAnnotation:
  Enabled: false
Style/GuardClause:
  Enabled: false
```

#### Notes

* The `TargetRubyVersion` has to be set to the corresponding Ruby version used
  in the project.
* `Style/Encoding` should be disabled in projects with Ruby >=2.0, which assumes
  UTF-8 encoding by default.
* The remaining entries are team consensus.

## What about the meta-gems?

In the past we used meta-gems
([nww_devtools](https://github.com/Nix-wie-weg/nww_devtools/tree/4fda80a6208f9bce1a008bb97357c8fb1f0cee84)
for Ruby 1.9.x and Ruby 2.x,
[nww_devtools_rails](https://github.com/Nix-wie-weg/nww_devtools_rails),
[rubocop-nww](https://github.com/Nix-wie-weg/rubocop-nww))
to incorporate all the common gems and settings we needed in almost every
Ruby project.
It turned out that we found us in dependency hell quickly.
Every small change in e. g. our RuboCop settings involved a bump of four gems.
This effectivly slowed us down maintaining these gems actively.

We want more activity and creativity so we concluded simply describing
these dependencies in a document and regularly checking our projects against it
could be a much cheaper solution. We'll see how this works out.


## Credits

* [funglaub](https://github.com/funglaub) former colleague
