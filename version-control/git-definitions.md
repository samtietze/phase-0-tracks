# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?
Version control is a concept that allows developers to track new code additions, create new features, or make changes to existing code without permanently altering the existing code. It allows a developer to evaluate whether these changes are good to go. Conversely, it allows them to determine where specific bugs occur.

* What is a branch and why would you use one?
Branches let multiple developers work on the same project simultaneously. Once each developer has finished their segment of the work, they may evaluate each added feature or code by merging them with the existing structure, or master. Similarly to version control, because each branch is separate, it allows a developer to examine where a bug occurs during testing of the new code.

* What is a commit? What makes a good commit message?
Commit is the way that the new files/code is added to a repository. The changes a developer makes to a file are only "saved" when the developer commits. Just as with any team-based communications, a good commit message is thoughtfully concise and specific. "Add stuff" would be an example of the vaguest possible message. "Revise login window fields" provides a more specific target of this new code.

* What is a merge conflict?
When both branches of a repository make changes to the same lines of code, the quick merging of branches back to the master cannot occur. The developers must examine the merge conflict and determine which of the changes to proceed with. Thankfully, git marks up the conflict in a pretty easy to digest way. This can also occur when one developer makes changes to a file that another developer erases. As above, the developer must choose which route to take.