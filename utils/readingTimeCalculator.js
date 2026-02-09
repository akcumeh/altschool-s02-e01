const calcReadingTime = (text) => {
    const wpm = 200;
    const wordCount = text.trim().split(/\s+/).length;
    const min = Math.ceil(wordCount / wpm);
    return min;
};

module.exports = calcReadingTime;