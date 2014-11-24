# A simple wrapper around HTTParty with the single purpose of setting some
# default options. And doing some wrapping.
#
class HTTP
  include HTTParty

  # Verify TLS certificates. Not a bad idea in the long run.
  default_options.update(verify: true)
end
