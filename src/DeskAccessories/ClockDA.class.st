"
Clock Desk Accesory draws a little digital clock in a window!
"
Class {
	#name : 'ClockDA',
	#superclass : 'SpPresenter',
	#instVars : [
		'#bigTime',
		'#currentTimeString => ObservableSlot'
	],
	#category : 'DeskAccessories',
	#package : 'DeskAccessories'
}

{ #category : 'examples' }
ClockDA class >> example [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"

	ClockDA open.
]

{ #category : 'instance creation' }
ClockDA class >> open [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"

	ClockDA new open.
]

{ #category : 'layout' }
ClockDA >> defaultLayout [
	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	^ SpBoxLayout newTopToBottom
		  add: bigTime;
		  yourself
]

{ #category : 'layout' }
ClockDA >> initializePresenters [
	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	bigTime := self newLabel.
	bigTime label: ''.
	bigTime displayBold: [ true ].
	bigTime displayColor: [ Color purple ].

	bigTime addStyle: 'label'.


	self
		property: #currentTimeString
		whenChangedDo: [ bigTime label: currentTimeString ]
]

{ #category : 'initialization' }
ClockDA >> initializeWindow: windowPresenter [
	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	| windowOpen worker |
	super initializeWindow: windowPresenter.

	windowPresenter initialExtent: 120 @ 80.
	
	windowOpen := true.

	windowPresenter whenClosedDo: [ windowOpen := false ].
   windowPresenter whenOpenedDo: [ windowPresenter window
		removeCollapseBox;
		removeExpandBox. ].
	worker := [
		          [ windowOpen ] whileTrue: [
				          currentTimeString := DateAndTime current asTime print24.
				          "printMinutes."
				          "Transcript show: 'tick'."
				          (Delay forSeconds: 1) wait ] ] fork
]
