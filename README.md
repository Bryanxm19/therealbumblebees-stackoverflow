# Honey Overflow
This will bee the sweetest version of Stack Overflow the world has ever seen.

## Team: The Real Bumblebees
- Bryan Mateer
- Tom Feng
- Alex Camacho
- Adriel Saporta
- Gurkanver Brar

## User Stories
- User can sign up for an account
- User can log into and log out of an account
- Logged out user can view all questions and answers
- Logged in user can post a question
- Logged in user can post an answer
- Logged in user can upvote or downvote a question or an answer
- Logged in user who posts a question can choose the "best" answer

## Git Workflow
-  Name the branch after the feature you're creating: git checkout -b "your-initials/name-of-feature" (you will need the quotes when you create a new branch name)
- Code your feature
- Check the status of your changes: git status
- Add the feature updates: git add (--patch)
- Then go back to the master branch: git checkout master
- Pull down all changes from master: git pull origin master. This is an important step! This makes sure you are handling all (if any) merge conflicts on your computer
- Merge the master branch with your feature branch: git checkout your-initials/name-of-feature and then merge your branch: git merge master your-initials/name-of-feature. If you have conflicts, you will see an alert. Resolve the conflicts.
- Then push up your feature branch: git push origin your-initials/name-of-feature. Note: never type git push origin master. Don't be that person who pushes to master :)
- Create a pull request on GitHub. Ask a teammate to approve your request.
