# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

require 'rake/testtask'
require 'rake/rdoctask'
require 'rcov/rcovtask'

begin
  require 'bones'
  Bones.setup
rescue LoadError
  begin
    load 'tasks/setup.rb'
  rescue LoadError
    raise RuntimeError, '### please install the "bones" gem ###'
  end
end

ensure_in_path 'lib'
require 'newsberry'

task :default => :test

desc 'Test the newsberry plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Performs code coverage on the newsberry plugin.'
Rcov::RcovTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

PROJ.name = 'newsberry'
PROJ.authors = 'Petyo Ivanov'
PROJ.email = 'petyo@wildbit.com'
PROJ.url = 'http://newsberry.com'
PROJ.version = Newsberry::VERSION
PROJ.rubyforge.name = 'newsberry'

PROJ.spec.opts << '--color'

# EOF
