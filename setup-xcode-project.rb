require 'xcodeproj'
# require 'pry'

project_path = 'Swiftylebot.xcodeproj'
project = Xcodeproj::Project.open(project_path)

developmentTarget = project.targets.select {|target| target.name == "Development"}

developmentTarget.first.build_configuration_list.build_configurations.each do |configuration|
  # binding.pry
  pathToAdd = "${TARGET_BUILD_DIR}/Swiftylebot.framework"
  searchPaths = configuration.build_settings["FRAMEWORK_SEARCH_PATHS"]
  searchPaths  << pathToAdd unless searchPaths.include?(pathToAdd)

  # puts searchPaths
end

project.save
