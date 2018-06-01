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

* Avoid selective ownership of code. ("mine", "not mine", "yours")
* Always ask for clarification if you are unsure about something.
* Keep it real and fun. Use emojis, gifs, etc. :+1:
* Give back your time to code review, like others do for you.
* Add the appropriate label after you have reviewed.

### Having Your Code Reviewed

* Use the Pull Request template in your favor.
* Add the corresponding Wrike ticket to each Pull Request.
* Add detailed reproduction/user-flow steps that are easy to follow.
* Add "potentially impacted"/"vulnerable areas" in addition to reproduction
  steps.
* Be grateful and appreciative to the code reviewer.
* Help to clear any misconceptions the reviewer may have.
* Wait until your code has the `Status: Review Complete` label.
* Once your code has the Review Complete label, you can add the 'Status: Ready to Ship' label to signify it's ready for release, assuming you've clarified it's ready to ship with stakeholders (if any).

### Reviewing Code

**What are we trying to accomplish while reviewing code?**

1. Ensure the code functions as intended.
2. Catch any bugs the code causes.
3. Ensure the code is readable.
4. Ensure the code is maintainable.
5. Ensure the code is secure.
6. Spread your knowledge throughout the team.

**Our code checklist**

* [ ] Does the code function?
* [ ] Is the code understandable?
* [ ] Is the code maintainable? Modular?
* [ ] Does the code conform to ProctorU standards and conventions?
* [ ] Does the code have redundancy? Is there related code that can be deleted?
* [ ] Does the code have performance issues?
* [ ] Does the code have security vulnerabilities?
* [ ] Can I remove any logging from the code?
* [ ] Does TomDoc documentation exist where it is needed?
* [ ] Is the code testable?
* [ ] Is the code tested? (System/Unit)
* [ ] Are there more features than necessary? Does this code do more than simply solving the problem? ([KISS Principle](https://en.wikipedia.org/wiki/KISS_principle))
