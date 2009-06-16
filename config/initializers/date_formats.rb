# Include your application configuration below
ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(
  :default => '%m/%d/%Y',
  :just_time => '%I:%M %p',
  :with_time => "%m/%d/%y at %I:%M %p",
  :spelled_out => "%b %d, %Y <br />\n<span>at %I:%M %p</span>"
  )

ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS.merge!(
  :default => '%m/%d/%Y',
  :spelled_out => "%a %b %d"
)