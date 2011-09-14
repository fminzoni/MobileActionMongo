package com.kdata.mobile.application
{	
	import com.kdata.mobile.domain.AppInit;

	public class InitHandler
	{
		
		[Inject] public var appInit : AppInit;
		
		[MessageHandler] public function initHandler( event : InitEvent ) : void {
			// set up the system
			appInit.initEnvironment();
		}
	}
}