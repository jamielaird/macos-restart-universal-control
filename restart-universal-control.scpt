-- Continue with rest of the script to open "Displays" and toggle settings
tell application "System Settings"
	activate
end tell

-- Wait for the System Settings window to open
delay 0.2

tell application "System Events"
	tell process "System Settings"
		-- Open "Displays" settings
		try
			click menu item "Displays" of menu "View" of menu bar 1
		on error
			-- If the menu approach fails, try navigating through the sidebar.
			click button "Displays" of scroll area 1 of window 1
		end try
		
		-- Wait for the Displays window to load
		delay 0.5
		
		-- Click the "Advanced…" button, if available
		try
			click button 1 of scroll area 2 of group 1 of group 2 of splitter group 1 of group 1 of window 1
		on error
			display dialog "Could not find the Advanced button."
			return
		end try
		
		-- Wait for the Advanced settings to appear
		delay 0.5
		
		-- Toggle the checkbox for "Allow your pointer and keyboard to move between any nearby Mac or iPad"
		try
			set pointerSetting to checkbox "Allow your pointer and keyboard to move between any nearby Mac or iPad" of group 2 of scroll area 1 of group 1 of sheet 1 of window 1
			if (value of pointerSetting as boolean) is true then
				click pointerSetting -- Turn it off
				delay 0.2
				click pointerSetting -- Turn it back on
			else
				click pointerSetting -- Turn it on
				delay 0.2
				click pointerSetting -- Turn it off and then back on
				click pointerSetting
			end if
		on error
			display dialog "Could not find the pointer and keyboard setting."
			return
		end try
	end tell
	
	-- Press the Escape key to close any dialogs
	key code 53
end tell

delay 0.2

quit application "System Settings"