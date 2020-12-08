crumb :root do
  link "しおり一覧", root_path
end

crumb :trip do |trip|
  link "#{trip.name}", trip_path(trip)
end

crumb :schedule do |schedule|
  link "#{schedule.name}", trip_schedule_path(schedule.trip, schedule)
  parent :trip, schedule.trip
end

crumb :event do |event|
  link "#{event.name}", trip_schedule_event_path(event.schedule.trip, event.schedule, event)
  parent :schedule, event.schedule
end

crumb :list do |list|
  link "#{list.name}", trip_list_path(list.trip, list)
  parent :trip, list.trip
end



# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).