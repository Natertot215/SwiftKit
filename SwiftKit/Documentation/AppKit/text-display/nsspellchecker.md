---
url: https://developer.apple.com/documentation/appkit/nsspellchecker
framework: AppKit
category: Text display
title: NSSpellChecker
kind: class
captured: 2026-05-02
---

# NSSpellChecker

An interface to the Cocoa spell-checking service.

## Declaration

```swift
class NSSpellChecker
```

### Overview

To handle all its spell checking, an app needs only one instance of `NSSpellChecker`, known as the spell checker. Using the spell checker you manage the Spelling panel, in which the user can specify decisions about words that are suspect. The spell checker also offers the ability to provide word completions to augment the text completion system.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Getting the Spell Checker

- `shared`
- `sharedSpellCheckerExists`

### Configuring Spell Checkers Languages

- `availableLanguages`
- `userPreferredLanguages`
- `automaticallyIdentifiesLanguages`
- `language()`
- `setLanguage(_:)`

### Managing Panels

- `spellingPanel`
- `substitutionsPanel`
- `updateSpellingPanel(withGrammarString:detail:)`
- `updatePanels()`
- `accessoryView`
- `substitutionsPanelAccessoryViewController`

### Checking Strings for Spelling and Grammar

- `countWords(in:language:)`
- `checkSpelling(of:startingAt:)`
- `checkSpelling(of:startingAt:language:wrap:inSpellDocumentWithTag:wordCount:)`
- `checkGrammar(of:startingAt:language:wrap:inSpellDocumentWithTag:details:)`
- `check(_:range:types:options:inSpellDocumentWithTag:orthography:wordCount:)`
- `requestChecking(of:range:types:options:inSpellDocumentWithTag:completionHandler:)`
- `guesses(forWordRange:in:language:inSpellDocumentWithTag:)`

### Managing the Spell-Checking Process

- `uniqueSpellDocumentTag()`
- `closeSpellDocument(withTag:)`
- `ignoreWord(_:inSpellDocumentWithTag:)`
- `ignoredWords(inSpellDocumentWithTag:)`
- `setIgnoredWords(_:inSpellDocumentWithTag:)`
- `setWordFieldStringValue(_:)`
- `updateSpellingPanel(withMisspelledWord:)`
- `completions(forPartialWordRange:in:language:inSpellDocumentWithTag:)`
- `hasLearnedWord(_:)`
- `unlearnWord(_:)`
- `learnWord(_:)`
- `userQuotesArray(forLanguage:)`
- `userReplacementsDictionary`

### Data Detector Interaction

- `menu(for:string:options:atLocation:in:)`
- `NSSpellChecker.OptionKey`

### Automatic Spelling Correction

- `correction(forWordRange:in:language:inSpellDocumentWithTag:)`
- `showCorrectionIndicator(of:primaryString:alternativeStrings:forStringIn:view:completionHandler:)`
- `record(_:toCorrection:forWord:language:inSpellDocumentWithTag:)`
- `dismissCorrectionIndicator(for:)`
- `NSSpellChecker.CorrectionIndicatorType`
- `NSSpellChecker.CorrectionResponse`

### Notifications

- `didChangeAutomaticSpellingCorrectionNotification`
- `didChangeAutomaticTextReplacementNotification`

### Type Properties

- `didChangeAutomaticCapitalizationNotification`
- `didChangeAutomaticDashSubstitutionNotification`
- `didChangeAutomaticPeriodSubstitutionNotification`
- `didChangeAutomaticQuoteSubstitutionNotification`
- `didChangeAutomaticTextCompletionNotification`
- `isAutomaticCapitalizationEnabled`
- `isAutomaticDashSubstitutionEnabled`
- `isAutomaticInlinePredictionEnabled`
- `isAutomaticPeriodSubstitutionEnabled`
- `isAutomaticQuoteSubstitutionEnabled`
- `isAutomaticSpellingCorrectionEnabled`
- `isAutomaticTextCompletionEnabled`
- `isAutomaticTextReplacementEnabled`

### Instance Methods

- `deletesAutospaceBetweenString(_:andString:language:)`
- `language(forWordRange:in:orthography:)`
- `preventsAutocorrection(before:language:)`
- `requestCandidates(forSelectedRange:in:types:options:inSpellDocumentWithTag:completionHandler:)`
- `showInlinePrediction(forCandidates:client:)`

## See Also

- `NSChangeSpelling`
- `NSIgnoreMisspelledWords`
