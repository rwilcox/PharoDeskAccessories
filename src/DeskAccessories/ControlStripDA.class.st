"
The ControlStrip DA gives us a half MacOS 9 Control Strip, half MacOS X ""Dock"" syle interface element for easy accessing tools etc.

If you like this you should subclass it, override #buttons and call whatever things you want.
"
Class {
	#name : 'ControlStripDA',
	#superclass : 'SpPresenter',
	#category : 'DeskAccessories',
	#package : 'DeskAccessories'
}

{ #category : 'examples' }
ControlStripDA class >> example [
	"comment stating purpose of class-side method"

	"scope: class-variables  &  class-instance-variables"

	ControlStripDA open
]

{ #category : 'instance creation' }
ControlStripDA class >> open [
	"comment stating purpose of class-side method"

	"scope: class-variables  &  class-instance-variables"

	self new open
]

{ #category : 'accessing' }
ControlStripDA >> buttons [
	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	^ {
		  ('Clock' -> 'ClockDA#open').
		  ('Calendar' -> 'CalendarDA#open') }
]

{ #category : 'layout' }
ControlStripDA >> defaultLayout [
	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	| output |
	output := SpBoxLayout newLeftToRight.

	self buttons do: [ :currentAssociation |
			| currentBtn currentValue parts clazz method |
			currentBtn := self newButton.
			currentBtn label: currentAssociation key.
			currentBtn action: [
					currentValue := currentAssociation value.
					(currentValue isKindOf: Symbol)
						ifTrue: [ self class perform: currentValue asSymbol ]
						ifFalse: [
								parts := currentValue splitOn: '#'. "support ClassName#methodName"
								parts first = ''
									ifTrue: [ "just #method" clazz := self class ]
									ifFalse: [ clazz := Smalltalk at: (parts first asSymbol) ].

								method := parts last asString.
								clazz perform: method asSymbol ] ].
			output add: currentBtn ].
	^ output
]
