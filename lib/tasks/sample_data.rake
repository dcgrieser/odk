namespace :sample_data do
  desc "populate"
  task :populate => :environment do
    students = [
      # Tappees
      {:first_name => 'Jamie', :last_name => 'Morissette', :email => 'jmorissette@miami.edu', :active => false},
      {:first_name => 'Loraine', :last_name => 'Bruening', :email => 'lbruening@miami.edu', :active => false},

      # Current students
      {:first_name => 'Neil', :last_name => 'Lok', :email => 'nlok@miami.edu', :active => true, :initiation_date => Date.new(2011, 2)},
      {:first_name => 'Fernando', :last_name => 'Guillermo', :email => 'fguillermo@miami.edu', :active => true, :initiation_date => Date.new(2010, 10)},

      # Past students
      {:first_name => 'Darren', :last_name => 'Esser', :email => 'desser@miami.edu', :active => false, :initiation_date => Date.new(2009, 2)},
      {:first_name => 'Benita', :last_name => 'Clouser', :email => 'bclouser@miami.edu', :active => false, :initiation_date => Date.new(2008, 10)},
    ]

    faculty = [
      # Current faculty
      {:first_name => 'Kelly', :last_name => 'Pascarelli', :email => 'kpascarelli@miami.edu', :title => 'President of the University', :active => true, :initiation_date => Date.new(2011, 1)},
      {:first_name => 'Lonnie', :last_name => 'Oshiro', :email => 'loshiro@miami.edu', :title => 'Professor', :active => true, :initiation_date => Date.new(2001, 2)},

      # Past faculty
      {:first_name => 'Clinton', :last_name => 'Ensminger', :email => 'censminger@miami.edu', :title => 'Professor', :active => false, :initiation_date => Date.new(1992, 10)},
      {:first_name => 'Cody', :last_name => 'Elders', :email => 'celders@miami.edu', :title => 'Associate Dean', :active => false, :initiation_date => Date.new(1969, 2)},
    ]

    officers = [
      # Current
      {
        :user => {:first_name => 'Max', :last_name => 'Natali', :email => 'mnatali@miami.edu', :active => true, :initiation_date => Date.new(2010, 8) },
        :role => {:title => 'President', :term_start_year => 2011},
      },

      {
        :user => {:first_name => 'Jessie', :last_name => 'Garg', :email => 'jgarg@miami.edu', :active => true, :initiation_date => Date.new(2010, 8) },
        :role => {:title => 'Historian', :term_start_year => 2011},
      },

      # Previous

      {
        :user => {:first_name => 'Kurt', :last_name => 'Jeffreys', :email => 'kjeffreys@miami.edu', :active => true, :initiation_date => Date.new(2009, 8) },
        :role => {:title => 'President', :term_start_year => 2010},
      },

      {
        :user => {:first_name => 'Neil', :last_name => 'Scheffel', :email => 'nsheffel@miami.edu', :active => true, :initiation_date => Date.new(2008, 8) },
        :role => {:title => 'Historian', :term_start_year => 2009},
      },

      # Past
      {
        :user => {:first_name => 'Hillary', :last_name => 'Beaudet', :email => 'hbeaudet@miami.edu', :active => false, :initiation_date => Date.new(2000, 8) },
        :role => {:title => 'Historian', :term_start_year => 2001},
      },
    ]

    students.each do |u|
      s = Student.create!(u)
      puts "created student: #{s.inspect}"
    end

    faculty.each do |u|
      f = Faculty.create!(u)
      puts "created faculty: #{f.inspect}"
    end

    officers.each do |o|
      u = Student.create!(o[:user].merge(:password => 'password', :password_confirmation => 'password'))
      r = Role.create!(o[:role].merge(:user_id => u.id))
      puts "created officer: #{u.inspect} with role #{r.inspect}"
    end
  end
end
