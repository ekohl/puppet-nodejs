require 'beaker-rspec'
require 'beaker/puppet_install_helper'
require 'beaker/module_install_helper'

run_puppet_install_helper
install_module_on(hosts)
install_module_dependencies_on(hosts)

# Additional modules for soft deps
install_module_from_forge('puppetlabs-apt', '>= 4.1.0 < 5.0.0')
install_module_from_forge('stahnma-epel', '>= 1.2.0 < 2.0.0')
install_module_from_forge('chocolatey-chocolatey', '>= 1.2.6 < 2.0.0')
install_module_from_forge('gentoo-portage', '>= 2.0.1 < 3.0.0')

UNSUPPORTED_PLATFORMS = %w[AIX Solaris].freeze

RSpec.configure do |c|
  # Readable test descriptions
  c.formatter = :documentation
end
