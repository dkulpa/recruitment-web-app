# recruitment-web-app
This is a spec for a candidate evaluation app.


## App requirements
1. After navigating to the root directory using a web browser, the app should display a login page. If the user is logged in, then user listing is being displayed. 
  Hint: it is usually a good idea to use a gem / working component to solve "standard" problems for a web app. In this context: https://github.com/plataformatec/devise

2. Userbase consists of two types of users: regular and admin.
  Hint: Do not overcomplicate this. Also stuff that may come handy later: https://github.com/ryanb/cancan or https://github.com/elabs/pundit

3. Admins can see a trash can icon next to each user on the listing. They can click it and delete an user. Admin should not be able to delete himself/herself. The listing includes the following information: email, gender, age, interests. Requirement: Interests is a separate table. User can have many points of interest in terms of AR association defined on the model level. Hence, the interest should belong to an user.

4. Admin can see a link "navigate to the admin panel" somewhere on the page. He can click the link to display that page (accessible only by admins).

5. In the admin panel there is a form, where an email, gender, age, points of interests can be specified for new and existing users. Requirement: the form should offer a possibility to dynamically specify the points of interest for the user, by adding additional fields to the form, without reloading the page. Each interest can have a name and a type (from the predefined collection of: ["health", "hobby", "work"]). When it comes to the number of interests, user can have any amount. New users created by admin should have a password set to "secret".
  Hint: https://github.com/ryanb/nested_form or https://github.com/nathanvda/cocoon

6. The admin panel should display a number which shows the amount of points of interests in the system of "health" type, chosen by women aged between 20 and 30, and the names of PoIs should start with "cosm". The query should be written using SQL or appriopriate DSL offered for instance by ActiveRecord. Usng Ruby for data manipualtion here is a faux pas. In other words, show me your SQL magic. Requirement: you should write a query with a subquery for this task.

7. On the regular users listing, admin can see a button "Export to CSV". After clicking a link, user gets a csv file with exported users. Hint https://www.ruby-toolbox.com/categories/reporting however you don't have to use any external gem. Feel free to use https://ruby-doc.org/stdlib-2.0.0/libdoc/csv/rdoc/CSV.html

8. On the user listing, everybody can see a mailbox icon. Everyone can click it. A click triggers an action where the email is being sent to the target user with content "<current user email> sends his regards". The recipient is of course the target user.   Requirement: use Service Object pattern to implement the email sending functionality. Hint: https://rubygems.org/gems/mailcatcher/versions/0.6.1

9. On the user listing there should be a search_field so users should be able to scope the listing by inputing the email. Bonus points for considering SQL injections while developing the feature. Hint: https://github.com/activerecord-hackery/ransack


## How to get started aka the workflow requirements
1. Download the repo and upload it as your own. Do not fork it.
2. Add your evaluator as a contributor to your repository clone, so he or she can review pull requests.
3. Implement each requirement in a separate commit. The app should work according to the spec describe in each stage. So if somebody does `git reset --hard <stage>`, he will encounter no problems with the given app version.
4. Each stage of the app development should be presented as a pull request. You can skip this requirement, work alone and present only a final solution. However there are bonus points for showing us that you can work using PR workflow. 
5. We love when a project has a test suite. Here is a hint: http://www.relishapp.com/rspec/rspec-rails/docs/gettingstarted
6. The initial commit with a fresh rails application should be a separate one. In other words, do not commit the rails app code with the first requirement code. 

# Good luck!
