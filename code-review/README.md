# ProctorU Guides

Guides is a foundation of best practices used by ProctorU's Engineering &
Design team. It includes best practices for Code Reviewing, Style Rules, and
much more.

---

## Code Review

At ProctorU, any change to the `master` branch will, at minimum, go through
two code reviews from an Engineer. If the changes made affect the front-end, a
member of our Design team will perform the third review. Below are a few
guidelines to follow during the review process.

### Everyone

- Avoid selective ownership of code. ("mine", "not mine", "yours")
- Always ask for clarification if you are unsure about something.
- Keep it real and fun. Use emojies, gifs, etc. :+1:
- Give back your time to code review, like others do for you.

### Having Your Code Reviewed

- Use the Pull Request template in your favor.
- Add the corresponding JIRA ticket to each Pull Request.
- Add detailed reproduction/user-flow steps that are easy to follow.
- Add "potentially impacted"/"vulnerable areas" in additional to reproduction
  steps.
- Be grateful and appreciative to the code reviewer.
- Help to clear any misconceptions the reviewer may have.
- Wait until your code has the `Status: Review Complete` label.
- Once your code has the Review Complete label, you can add the 'Status: Ready to Ship' label to signify it's ready for release, assuming you've clarified it's ready to ship with stakeholders (if any). 

### Reviewing Code

- Understand the change. Understand _why_ the change is being made.
- Identify areas for refactoring that still solve the problem.
- Determine if the author needs to add descriptive comments to their classes. If the code is self-documenting it may be skipped. 
- Add the appropriate label after you have reviewed and approved
  (`Status: Reviewed`, `Status: Review Complete`).
