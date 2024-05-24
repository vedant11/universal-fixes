## study git

```sh
git clone git@github.com:git/git.git
git rev-list --max-parents=0 HEAD
git checkout e83c5163316f89bfbde7d9ab23ca2e25604af290
git log
code README.md
```

## squash last two commits

```sh
git rebase -i HEAD~2
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

## update stash and save patch

```sh
git stash list # check whether any other import work is up
git stash drop "$(git stash list | awk '/On your-branch-name: your-message-v1/ {gsub(/:/, "", $1); print $1}')"
# or git stash drop stash@{your-specific-index}
git add .
git stash save -m "your-message-v2"
# get the changes back
git stash apply
# generate patch
git stash show -p stash@{0} > changes.patch
```
