brew update
brew install postgresql
brew services start postgresql
brew --prefix postgresql@14
echo 'export PATH="/usr/local/opt/postgresql@14/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

# postgresql@14 is the latest version
psql --version
psql postgres

# creating a user inline from zsh for demo, should be done in the psql shell itself
psql postgres -c "CREATE ROLE postgres WITH LOGIN PASSWORD 'postgres';"
psql postgres -c "ALTER ROLE postgres CREATEDB;"