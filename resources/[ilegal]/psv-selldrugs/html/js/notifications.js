function Notify(text, type, duration) {
    $.post('https://psv-selldrugs/notification', JSON.stringify({ text: text, type: type, duration: duration }));
}