# Toy - Web

## Debugging Challenge

The goal of this assignment is to practice debugging.

### Getting Started

#### Installation

First, fork this repository, if you haven't already.

Then clone your fork on to your local development machine:

```zsh
cd ~/Code
git clone url_for_your_copy_of_this_assignment
```

(Note: You'll need to replace `url_for_your_copy_of_this_assignment` with the actual SSH URL for your repository, which looks something like `git@github.com:sumeetjain/web-toy__some-assignment.git`.)

That will create a folder named for the assignment in **~/Code**, and it will download the files from the repository into that folder.

Next, `cd` into that newly created folder, and run the setup script:

```zsh
cd the-newly-created-folder
bin/setup
```

(Note: You'll need to replace `the-newly-created-folder` with the actual name of the folder for your assignment.)

You won't need to run the setup script for this assignment again.

If the setup script does not return any failures or errors, you're ready to work on the assignment. Open the project folder in your code editor, and begin.

### Assignment Details

Simply put, fix the application. Here are the features of the application that should work:

#### Homepage

- Should list several students (along with some information about their grades)
- Should list all of the assignments
- Each student's name should be linked to their profile
- Each assignment's title should be linked to its details page

#### Student Profile

- Should display the student's name
- Should list all assignments, indicating whether the student turned each in and grade info for that assignment
- Each assignment title should be linked to its details page
- Should display a link back to the homepage

#### Assignment Detail Page

- Should display the assignment's title
- Should display the assignment's difficulty
- Should list the students who have turned the assignment in (along with grade info)
- Each student's name should be linked to their profile
- Should display a link back to the homepage

#### How to Begin

We went through the first few errors as a class:

##### 1. SyntaxError

```
syntax error, unexpected keyword_end, expecting ')' (SyntaxError)

app/models/student.rb:50: syntax error, unexpected keyword_end, expecting ')'
```

This error is thrown immediately upon running `rackup`, meaning the server cannot even start until it is fixed.

The solution was to meticulously check the referenced file for missing or extraneous syntax that caused Ruby to fail to interpret it.

##### 2. NoMethodError

```
NoMethodError - undefined method `turned_in_assignment?' for #<MyApp:0x007ff491f972d8>:

app/views/admin/view_student.erb:19:in `block (2 levels) in singleton class'
```

This error is thrown when we try to view any student's profile page.

The solution is determining either 1) the correct name of the method (e.g. Did we misspell the method?), or 2) the correct object upon which to call the method (i.e. Are we trying to call a method on an object which doesn't support that method?).

`Command + Shift + F` is useful here, because we can search our entire project for occurrences of `turned_in_assignment?` in code.

This error has a close cousin: `NameError - undefined local variable or method`.

##### 3. ArgumentError

```
ArgumentError - wrong number of arguments (0 for 1):
app/models/student.rb:48:in `turned_in_assignment?'
app/views/admin/view_student.erb:20:in `block (2 levels) in singleton class'
```

This is the error we get after _fixing_ the previous error!

The solution is determining how to correctly use the `turned_in_assignment?` method, because apparently we're not giving it the right number of inputs.

### Extras

If you're interested, try adding some features to the application. Here are some ideas:

- 