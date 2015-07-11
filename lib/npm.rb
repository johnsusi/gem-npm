require 'json'
require 'rbconfig'

class Npm

  def initialize(file = 'package.json')
    @config = JSON.parse(File.read(file))
    @dir = File.absolute_path( File.dirname(file) )
    add_path(`npm bin`.to_s.strip)
  end

  def description
    return @config['description']
  end

  def name
    return @config['productName'] || @config['name']
  end

  def version
    return @config['version']
  end

  def keywords
    return @config['keywords']
  end

  def homepage
    return @config['homepage']
  end

  def bugs
    return @config['bugs']
  end

  def license
    return @config['license']
  end

  def author
    return @config['author']
  end

  def contributors
    return @config['contributors']
  end

  def files
    return @config['files']
  end

  def main
    return @config['main']
  end

  def bin
    return @config['bin']
  end

  def man
    return @config['man']
  end

  def directories
    return @config['directories']
  end

  def repository
    return @config['repository']
  end

  def scripts
    return @config['scripts']
  end

  def config
    return @config['config']
  end

  def dependencies
    return @config['dependencies']
  end

  def devDependencies
    return @config['devDependencies']
  end

  def peerDependencies
    return @config['peerDependencies']
  end

  def bundledDependencies
    return @config['bundledDependencies']
  end

  def optionalDependencies
    return @config['optionalDependencies']
  end

  def engines
    return @config['engines']
  end

  def os
    return @config['os']
  end

  def cpu
    return @config['cpu']
  end

  def preferGlobal
    return @config['preferGlobal']
  end

  def preferGlobal?
    return @config['preferGlobal'] ? true : false
  end

  def private
    @config['private']
  end

  def private?
    return @config['private'] ? true : false
  end

  def invoke(cmd)
    Dir.chdir(@dir) do
      result = `#{cmd}`
      fail unless $?.to_i == 0
      return result
    end
  end

  def install(name = '', options = {})
    return invoke("npm install #{name}#{options['save'] ? ' -save' : ''}#{options['global'] ? ' -g' : ''}")
  end

  def run(*scripts)
    return scripts.collect { |script| invoke("npm run -s #{script}") }
  end

  def method_missing(method_id)
    method_name = method_id.id2name
    return @config[method_name]
  end

  def path_separator
    return (RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/) ? ';' : ':'
  end

  def add_path(*paths)
    paths.each { |path| path.strip! }
    ENV['PATH'] = ENV['PATH'].
        split(path_separator).
        unshift(*paths).
        uniq.
        join(path_separator)
  end

  private :invoke, :path_separator, :add_path

end
