pre-commit autoupdate --repo https://github.com/pre-commit/pre-commit-hooks
pre-commit install
pre-commit install --hook-type commit-msg
git config pull.rebase false
git pull
git config --global commit.template commit.txt
