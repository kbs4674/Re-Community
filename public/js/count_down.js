CountDownTimer('01/01/2019', 'countdown');
CountDownTimer('08/31/2018 11:59 PM', 'newcountdown');

    function CountDownTimer(dt, id)
    {
        var end = new Date(dt);

        var _second = 1000;
        var _minute = _second * 60;
        var _hour = _minute * 60;
        var _day = _hour * 24;
        var timer;

        function showRemaining() {
            var now = new Date();
            var distance = end - now;
            if (distance < 0) {

                clearInterval(timer);
                document.getElementById(id).innerHTML = 'EXPIRED!';

                return;
            }
            var days = Math.floor(distance / _day);
            var hours = Math.floor((distance % _day) / _hour);
            var minutes = Math.floor((distance % _hour) / _minute);
            var seconds = Math.floor((distance % _minute) / _second);

            document.getElementById(id).innerHTML = days + '일 ';
            document.getElementById(id).innerHTML += hours + '시간 ';
            document.getElementById(id).innerHTML += minutes + '분 ';
            document.getElementById(id).innerHTML += seconds + '초';
        }

        timer = setInterval(showRemaining, 1000);
    }