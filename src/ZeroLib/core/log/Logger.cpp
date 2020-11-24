#include "ZeroLib/core/log/Logger.h"
#include <cstdio>

const Zero::Logger::Color Zero::Logger::Color::RESET("\033[0m");
const Zero::Logger::Color Zero::Logger::Color::WHITE("\033[37m");
const Zero::Logger::Color Zero::Logger::Color::BLACK("\033[30m");
const Zero::Logger::Color Zero::Logger::Color::RED("\033[91m");
const Zero::Logger::Color Zero::Logger::Color::BLUE("\033[94m");
const Zero::Logger::Color Zero::Logger::Color::GREEN("\033[92m");
const Zero::Logger::Color Zero::Logger::Color::YELLOW("\033[93m");
Zero::Logger::Color::Color(const char* escapeCode) : m_escapeCode(escapeCode) {}

const Zero::Logger::Level Zero::Logger::Level::DEBUG("DEBUG", Zero::Logger::Color::WHITE);
const Zero::Logger::Level Zero::Logger::Level::TRACE("TRACE", Zero::Logger::Color::BLUE);
const Zero::Logger::Level Zero::Logger::Level::INFO("INFO", Zero::Logger::Color::GREEN);
const Zero::Logger::Level Zero::Logger::Level::WARNING("WARNING", Zero::Logger::Color::YELLOW);
const Zero::Logger::Level Zero::Logger::Level::ERROR("ERROR", Zero::Logger::Color::RED);
Zero::Logger::Level::Level(const char* name, const Color& color)
	: m_name(name), m_color(color) {}

Zero::Logger::Logger(const char* name, std::ostream& stream)
	: m_name(name), m_stream(stream) {}

void Zero::Logger::log(const Zero::Logger::Level& level, const char* format, va_list entries) {
	static char buffer[1024];
	vsnprintf(buffer, 1024, format, entries);
	m_stream << "[" << m_name << "] " << level.getColor().getEscapeCode() << "[" << level.getName() << "] " << buffer << Color::RESET.getEscapeCode() << std::endl;
}