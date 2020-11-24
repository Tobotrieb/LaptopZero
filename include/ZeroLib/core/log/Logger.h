#pragma once
#include "../ZLApi.h"
#include <cstdarg>
#include <ostream>

namespace Zero {

	class ZLAPI Logger {
	public:
		class Color {
		public:
			static const Color RESET;
			static const Color WHITE;
			static const Color BLACK;
			static const Color RED;
			static const Color BLUE;
			static const Color GREEN;
			static const Color YELLOW;
		private:
			const char* m_escapeCode;
		private:
			Color(const char* escapeCode);
			~Color() = default;
		public:
			inline const char* getEscapeCode() const { return m_escapeCode; }
		};

		class Level {
		public:
			static const Level DEBUG;
			static const Level TRACE;
			static const Level INFO;
			static const Level WARNING;
			static const Level ERROR;
		private:
			const char* m_name;
			const Color& m_color;
		private:
			Level(const char* name, const Color& color);
			~Level() = default;
		public:
			inline const char* getName() const { return m_name; }
			inline const Color& getColor() const { return m_color; }
		};
	private:
		const char* m_name;
		std::ostream& m_stream;
	public:
		Logger(const char* name, std::ostream& stream);

#define VA_LIST_FUNC(level, format) \
	va_list va; \
	va_start(va, format); \
	log(level, format, va); \
	va_end(va);

		void log(const Level& level, const char* format, va_list entries);
		inline void logDebug(const char* format, ...) {VA_LIST_FUNC(Level::DEBUG, format)}
		inline void logTrace(const char* format, ...) { VA_LIST_FUNC(Level::TRACE, format) }
		inline void logInfo(const char* format, ...) { VA_LIST_FUNC(Level::INFO, format) }
		inline void logWarning(const char* format, ...) { VA_LIST_FUNC(Level::WARNING, format) }
		inline void logError(const char* format, ...) { VA_LIST_FUNC(Level::ERROR, format) }
	};

}