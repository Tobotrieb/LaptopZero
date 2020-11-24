#include "ZeroLib/ZeroLib.h"
#include <iostream>

int main() {
	Zero::Logger logger("Zero", std::cout);
	logger.logDebug("Debug!");
	logger.logTrace("Trace!");
	logger.logInfo("Info!");
	logger.logWarning("Warning!");
	logger.logError("Error!");
}