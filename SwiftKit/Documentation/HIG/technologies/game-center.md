---
url: https://developer.apple.com/design/human-interface-guidelines/game-center
framework: HIG
category: Technologies
title: Game Center
kind: article
captured: 2026-05-02
---

# Game Center

**Apple's social gaming network** that lets players track their progress and connect with friends across Apple platforms, boosting game discovery across players' devices.

---

## Overview

Supporting Game Center in your game allows players to:

- Discover new games their friends are playing
- Seamlessly invite friends to play
- See the latest activity from their games across the system, in the Apple Games app, the App Store, notifications, and more

By enabling player activities, supporting Game Center also helps surface your game to more players across Apple platforms.

You can add Game Center into your game using the **GameKit framework**, which provides full-featured UI for easy Game Center data access and viewing within your game, or present this data within custom UI.

---

## Accessing Game Center

### Integrating the Access Point

The Game Center **access point** is an Apple-designed UI element that lets players view their Game Center profile and information without leaving your game.

**In iOS, iPadOS, and macOS:** The access point leads players to the Game Overlay, a system overlay allowing players to view their progress and start game activities.

**In visionOS and tvOS:** The access point leads players to the in-game dashboard, a full-screen view of a player's Game Center activity appearing on top of your game.

#### Access Point Guidelines

| Guideline | Details |
|-----------|---------|
| **Display in menu screens** | Add the access point to the main menu or settings area. Avoid displaying during active gameplay, splash screens, cinematic flows, or tutorials. |
| **Avoid overlapping controls** | Present at any of four screen corners in a fixed position. Check for overlap with important UI and adjust layout accordingly. |
| **Pause game during overlay/dashboard** | Pausing helps players view Game Center information without feeling the game continues without them. |

**Note (visionOS):** Access point locations vary based on game type (immersive or volume-based).

### Using Custom UI

Your game can include custom links into the Game Overlay (iOS, iPadOS, macOS) or dashboard (visionOS, tvOS), deep-linking into specific areas like leaderboards or player profiles.

#### Custom UI Best Practices

- **Use official artwork:** Reference Game Center features using official artwork from Apple Design Resources. Preserve appearance and don't adjust dimensions or visual effects.
- **Use correct terminology:**

| Term | Incorrect Terms | Localization |
|------|-----------------|--------------|
| Game Center | GameKit, GameCenter, game center | Use system-provided translation of *Game Center* |
| Game Center Profile | Profile, Account, Player Info | Use system-provided translation of *Game Center* and localize *Profile* |
| Achievements | Awards, Trophies, Medals | — |
| Leaderboards | Rankings, Scores, Leaders | — |
| Challenges | Competitions | — |
| Add Friends | Add, Add Profiles, Include Friends | — |

---

## Achievements

Achievements give players incentive to stay engaged with your game. Game Center achievements appear in collectible card format highlighting player progress and showcasing artwork.

### Integrating Achievements into Your Game

- **Align with Game Center achievement states:** Game Center defines four states: locked, in-progress, hidden, and completed. The system groups achievements by completion status, providing consistent experience.
- **Determine display order:** Achievements appear in upload order. Consider ordering that corresponds to common gameplay path.
- **Be succinct in descriptions:** Achievement cards limit title and description to two lines each. Use title-style capitalization for titles and sentence-style for descriptions.
- **Give players a sense of progress:** Progressive achievements display player progress with encouraging messages like "You're more than halfway to completing [achievement name]. Keep going!"

### Creating Achievement Images

**Design rich, high-quality images** that help players feel rewarded. Avoid reusing the same asset for multiple achievements. If no asset is provided, a placeholder image appears.

#### Achievement Image Specifications

**iOS, iPadOS, macOS, visionOS:**
| Attribute | Value |
|-----------|-------|
| Format | PNG, TIF, or JPG |
| Color space | sRGB or P3 |
| Resolution | 72 DPI (minimum) |
| Image size | 512x512 pt (1024x1024 px @2x) |
| Mask diameter | 512 pt (1024 px @2x) |

**tvOS:**
| Attribute | Value |
|-----------|-------|
| Format | PNG, TIF, or JPG |
| Color space | sRGB or P3 |
| Resolution | 72 DPI (minimum) |
| Image size | 320x320 pt (640x640 px @2x) |
| Mask diameter | 200 pt (400 px @2x) |

---

## Leaderboards

Leaderboards encourage friendly competition. Players can check ranking against friends and global players and receive notifications when friends challenge them or pass their score.

### Leaderboard Types

- **Classic leaderboards:** Track a player's best all-time score. Always active with no ending. Examples:
  - Strive for most perfect score in rhythm game
  - Collect most coins in single dungeon run
  - Achieve longest continuous time in endless runner

- **Recurring leaderboards:** Reset based on defined time interval (weekly, daily). Increase engagement by giving players more chances to lead. Examples:
  - Daily rotating puzzles
  - Seasonal or holiday-themed events
  - Weekly leaderboards for different battle modes

### Leaderboard Sets

Organize multiple leaderboards by themes or gameplay experiences:
- Difficulty modes (Easy, Standard, Hard)
- Activity types (Combat, Crafting, Farming)
- Genres and themes (Disco, Pop, Rock)

### Leaderboard Images

**Add leaderboard images** to reinforce visual aesthetic. Create unique image for each leaderboard reflecting gameplay involved in ranking.

#### Leaderboard Image Specifications

**iOS, iPadOS, macOS:**
| Attribute | Value |
|-----------|-------|
| Format | JPEG, JPG, or PNG |
| Color space | sRGB or P3 |
| Resolution | 72 DPI (minimum) |
| Image size | 512x512 pt (1024x1024 px @2x) |
| Cropped area | 512x312 pt (1024x624 px @2x) |

**tvOS:** Provide set of images that animate when artwork is in focus.
| Attribute | Value |
|-----------|-------|
| Format | PNG, TIF, or JPG |
| Color space | sRGB or P3 |
| Resolution | 72 DPI (minimum) |
| Image size | 659x371 pt (1318x742 px @2x) |
| Focused size | 618x348 pt (1236x696 px @2x) |
| Unfocused size | 548x309 pt (1096x618 px @2x) |

**Note:** Be mindful of cropping effects on artwork. In iOS, iPadOS, and macOS, the system crops artwork for leaderboards in sets. In tvOS, focus effect may crop images at edges. Ensure primary content stays visible.

---

## Challenges

Challenges turn single-player activities into multiplayer experiences with friends, built on top of leaderboards with time limits.

### Creating Engaging Challenges

Challenges work best for short, skill-based gameplay activities (1-5 minutes) with clear accomplishment metrics:
- Complete fastest lap in racing level
- Defeat most enemies in single round
- Solve daily puzzle with fewest mistakes

**Avoid creating challenges** that track overall progress or personal best scores—these give regular players unfair advantage. Track players' most recent score after each attempt instead.

### Challenge Best Practices

- **Make it easy to jump in:** Players access challenges through invitation links, Game Overlay, or Games app. Deep-link to exact mode/level where challenge begins. Complete initial onboarding before challenge begins.
- **Create high-quality artwork:** System shows artwork in Game Overlay, Games app, and invitation link previews. Avoid placing primary content where title/description might cover it. Provide localized text versions if needed.

#### Challenge Image Specifications

| Attribute | Value |
|-----------|-------|
| Format | JPEG, JPG, or PNG |
| Color space | sRGB or P3 |
| Resolution | 72 DPI (minimum) |
| Image size | 1920x1080 pt (3840x2160 px @2x) |
| Cropped area | 1465x767 pt (2930x1534 px @2x) |

---

## Multiplayer Activities

Game Center supports real-time and turn-based multiplayer activities enabling player connection with friends or other players. Access through party codes, Game Overlay, dashboard, or Games app.

### Party Codes

**Use party codes to invite players** to multiplayer activities. Game Center generates alpha-numeric codes (typically 8 characters, e.g., "2MP4-9CMF").

Guidelines:
- Allow players to join gameplay late, leave early, and return later
- Provide way for players to view current party code in-game
- Allow players to enter party code manually

### Multiplayer Activity Support

**Support multiplayer activities through in-game UI.** Game Overlay and Game Center dashboard help players find others without leaving your game. Game Center's default interface lets players invite nearby/recent players, Game Center friends, and contacts. Present multiplayer functionality in custom UI as alternative.

### Multiplayer Activity Images

**Provide engaging activity artwork.** Players see preview images throughout the system (party code, Games app, in-game UI).

#### Multiplayer Activity Image Specifications

| Attribute | Value |
|-----------|-------|
| Format | JPEG, JPG, or PNG |
| Color space | sRGB or P3 |
| Resolution | 72 DPI (minimum) |
| Image size | 1920x1080 pt (3840x2160 px @2x) |
| Cropped area | 1465x767 pt (2930x1534 px @2x) |

---

## Platform Considerations

### iOS, iPadOS, macOS, visionOS

No additional considerations.

### tvOS

**Display optional image at top of dashboard:** Add artwork to highlight game's aesthetic. Use simple, easily recognizable image looking great at distance. Consider using game logo or word mark; don't use app icon.

| Attribute | Value |
|-----------|-------|
| Image size | 600x180 pt (1200x360 px @2x) |
| Format | PNG, TIF, or JPG |
| Color space | sRGB or P3 |
| Resolution | 72 DPI (minimum) |

### watchOS

**Be aware of Game Center support on watchOS:** While GameKit features and API are available for watchOS games, there's no system-supported Game Center UI to invoke. Game Center content for watchOS games appears on connected iPhone instead.

---

## Resources

### Related
- [Designing for Games](/design/human-interface-guidelines/designing-for-games)
- [Game Controls](/design/human-interface-guidelines/game-controls)
- [Apple Design Resources](https://developer.apple.com/design/resources/#technologies)

### Developer Documentation
- [GameKit](/documentation/GameKit)
- [Creating activities for your game](/documentation/GameKit/creating-activities-for-your-game)
- [Creating engaging challenges from leaderboards](/documentation/GameKit/creating-engaging-challenges-from-leaderboards)
- [Create games for Apple platforms](https://developer.apple.com/games/)
- [Game Porting Toolkit](https://developer.apple.com/games/game-porting-toolkit/)

### Videos
- WWDC 2025 Session 214: Get started with Game Center
- WWDC 2025 Session 215: Engage players with the Apple Games app

---

## Change Log

| Date | Changes |
|------|---------|
| June 9, 2025 | Added guidance for new challenges and multiplayer activities, and considerations for Apple Games app and Game Overlay. Updated guidance and specifications for activity preview images. |
| February 2, 2024 | Added links to developer guidance on using access point and dashboard in visionOS game. |
| September 12, 2023 | Added artwork for iOS achievement layout. |
| May 2, 2023 | Consolidated guidance into one page. |
