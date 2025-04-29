To fix the issue:

🔹 1. Use a Classic Personal Access Token
Fine-grained tokens do not support repository_dispatch across repos. You need to use a classic token.

🔗 Generate a Classic PAT here

🔹 2. Assign the Right Scopes
When generating the token:

✅ repo — Full control of private repositories (mandatory)

✅ workflow — Update GitHub Actions workflows

You don’t need to restrict it to a single repo — this will ensure it can fire repository_dispatch to another repo.

🔹 3. Store the Classic PAT in Repo A as PERSONAL_ACCESS_TOKEN
In Repo A:

Go to Settings > Secrets and variables > Actions

Add new secret:

Name: PERSONAL_ACCESS_TOKEN

Value: (Paste the newly generated classic PAT)

🔁 Then re-run the workflow in Repo A
That should fix the 403 and successfully trigger the workflow in Repo B.

Would you like a one-line shell command to test the token manually before committing the workflow?