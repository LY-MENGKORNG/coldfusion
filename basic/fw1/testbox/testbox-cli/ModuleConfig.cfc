/**
 *********************************************************************************
 * Copyright Since 2014 CommandBox by Ortus Solutions, Corp
 * www.coldbox.org | www.ortussolutions.com
 ********************************************************************************
 *
 * @author Brad Wood, Luis Majano
 */
component {

	this.name      = "TestBox CLI";
	this.version   = "1.6.0+23";
	this.cfmapping = "testboxCLI";

	function configure(){
		settings = { templatesPath : modulePath & "/templates" }
	}

	function onLoad(){
		// log.info('Module loaded successfully.' );
	}

	function onUnLoad(){
		// log.info('Module unloaded successfully.' );
	}

}
