# GitHub Commits Viewer

A Flutter application to display commits from a GitHub repository using the GitHub API.

## Configuration

### 1. Obtain a GitHub Authentication Key

To use this project, you need to obtain a GitHub authentication key. Follow these steps:

1. Log in to your GitHub account.

2. Click on your avatar in the top right corner and select "Settings."

3. In the left sidebar, select "Developer settings."

4. Click on "Personal access tokens."

5. Click on "Generate token."

6. Provide a descriptive name for the token and select the scope (`public_repo` for public repositories).

7. Click on "Generate token" at the bottom of the page.

8. Copy the generated token and save it securely, as you won't be able to see it again.

### 2. Create the .env File from the Template

This project uses a `.env` file to store the GitHub authentication key. Follow these steps:

1. Copy the content of the `.env.template` file:

   ```env
   GITHUB_AUTH_TOKEN=
   ```

2. Create a new file named .env in the root of the project.

3. Paste the GitHub authentication key into the GITHUB_AUTH_TOKEN field in the .env file.

## Installation

Before you begin, make sure you have Flutter installed on your machine. You can get Flutter from [here](https://flutter.dev/docs/get-started/install).

1. Clone this repository:

   ```bash
   git clone https://github.com/JosueLemus/GitHub_commit_viewer
   ```

2. Change to the project directory:

```bash
cd GitHub_commit_viewer
```

3. Run the following command to get dependencies:

```bash
flutter pub get
```

## Run on Android

Ensure you have an Android emulator or a connected device.

```bash
flutter run
```

## Run on iOS

Ensure you have Xcode installed on your machine.

```bash
flutter run
```

## Run on web

```bash
flutter run -d chrome --web-renderer html
```

This will launch the application in a web browser.
