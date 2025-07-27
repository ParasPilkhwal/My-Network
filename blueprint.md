### Logout Feature

**Overview:** Add a logout option to the Profile Settings screen that allows users to sign out of their account.

**Features:**
* Add a "Logout" button/list tile to the Profile Settings screen.
* Implement an action to call the `AuthService.signOut()` method.
* Navigate the user back to the login screen upon successful logout.

**Plan:**
1. Read the content of `lib/profile_setting_screen.dart`.
2. Modify the `build` method to include a new `_buildSettingsItem` for Logout.
3. Implement the `onTap` callback for the Logout item to call `AuthService.signOut()` and navigate to `/login`.
4. Write the modified content back to `lib/profile_setting_screen.dart`.
