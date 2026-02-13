"
A window you can write simple things in.

It does not save to a file or anything: if you close the window the note is gone. (But you can save the image with the window open and it'll be there next time!)
"
Class {
	#name : 'StickyNoteWindow',
	#superclass : 'SpPresenter',
	#instVars : [
		'textControl'
	],
	#category : 'DeskAccessories',
	#package : 'DeskAccessories'
}

{ #category : 'examples' }
StickyNoteWindow class >> example [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"

	StickyNoteWindow open.
]

{ #category : 'instance creation' }
StickyNoteWindow class >> open [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"

	StickyNoteWindow new open.
]

{ #category : 'layout' }
StickyNoteWindow >> defaultLayout [
	^ SpBoxLayout newTopToBottom
		  add: textControl;
		  yourself
]

{ #category : 'initialization' }
StickyNoteWindow >> initializePresenters [
	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	textControl := self newText.
]
