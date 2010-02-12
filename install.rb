# Try to detect which javascript frameworks the app supports and copy corresponding javascript includes

src_dir = File.join(File.dirname(__FILE__), 'javascripts')
dest_dir = File.join(RAILS_ROOT, 'public', 'javascripts')
javascripts = Dir.entries(dest_dir)
packages = [
  ['jQuery', /jquery/],
  ['Low Pro', /low-?pro/],
  ['Prototype', /prototype/]
]
packages.each do |package|
  if javascripts.any?{|f| f =~ package.last}
    puts "#{package.first} detected. Copying files..."
    filename = "ajax-will-paginate.#{package.first.downcase.delete(' ')}.js"
    src_file = File.join(src_dir, filename)
    dest_file = File.join(dest_dir, filename)
  end
end

puts "Remember to specify your javascript framework (default is Prototype):"
puts "AjaxWillPaginate.javascript_framework = :jquery  # or :prototype or :lowpro"
puts "This can be added via environment.rb or an initializer"
puts "You can then use <%= ajax_will_paginate_javascript_include_tag %> in your layouts."