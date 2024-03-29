## squash last two commits

```sh
git rebase -s HEAD~2
```

<!-- then make sure prefix is `pick` for the commit you want to keep preserved. rest, `s` -->

## change signature, date, or message of the last commit

```sh
git commit --amend -m "New commit message"
```

> the following can cause problems if datetime for commits is not sequential in the branch history

```sh
GIT_COMMITTER_DATE="date" git commit --amend --no-edit --date "date"
```
