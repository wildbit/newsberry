# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{newsberry}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Petyo Ivanov"]
  s.date = %q{2009-04-21}
  s.description = %q{Simple package that allows you to manage your newsberry contacts.}
  s.email = %q{petyo@wildbit.com}
  s.extra_rdoc_files = ["History.txt", "README.txt"]
  s.files = [".gitignore", "History.txt", "README.txt", "Rakefile", "lib/newsberry.rb", "lib/newsberry/list.rb", "test/credentials.yml.sample", "test/newsberry_test.rb", "test/test_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://newsberry.com}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{newsberry}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Simple package that allows you to manage your newsberry contacts}
  s.test_files = ["test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bones>, [">= 2.4.2"])
    else
      s.add_dependency(%q<bones>, [">= 2.4.2"])
    end
  else
    s.add_dependency(%q<bones>, [">= 2.4.2"])
  end
end
