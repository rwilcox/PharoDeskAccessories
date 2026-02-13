"
Wraps the CalendarMorph into a window
"
Class {
	#name : 'CalendarDA',
	#superclass : 'SpPresenter',
	#instVars : [
		'calendarNavigator'
	],
	#category : 'DeskAccessories',
	#package : 'DeskAccessories'
}

{ #category : 'examples' }
CalendarDA class >> example [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"

	CalendarDA open.
]

{ #category : 'instance creation' }
CalendarDA class >> open [
	CalendarDA new open.
]

{ #category : 'layout' }
CalendarDA >> defaultLayout [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	^ SpBoxLayout newTopToBottom add: calendarNavigator ; yourself.
]

{ #category : 'initialization' }
CalendarDA >> initializePresenters [

	| calendarAsMorph |
	calendarAsMorph := CalendarMorph openOn: Date today.
	calendarNavigator := SpMorphPresenter new
		                     morph: calendarAsMorph;
		                     yourself.
]
