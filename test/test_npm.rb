require 'minitest/autorun'
require 'npm'

class NpmTest < Minitest::Test

  def setup
    @npm = Npm.new( File.join( File.dirname(__FILE__), 'package.json' ) )
  end

  def test_properties

    assert_equal "module-name", @npm.name
    assert_equal "10.3.1",      @npm.version

    assert @npm.keywords.include? "nodejitsu"
    assert @npm.keywords.include? "example"
    assert @npm.keywords.include? "browsenpm"

    assert @npm.preferGlobal?
    assert @npm.private?

  end

  def test_scripts
    assert_equal "im about to deploy", @npm.run('predeploy').join.strip
  end

end
