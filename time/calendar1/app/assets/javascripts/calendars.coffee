# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.onload = () ->

	# 現在日を取得し、当月1日の曜日と末日を求めます。
	now = new Date()
	days = new Date(now.getFullYear(), now.getMonth() + 1, 0).getDate()
	today = now.getDate()
	wday = new Date( now.getFullYear(), now.getMonth(), 1 ).getDay()
	lastDay = new Date( now.getFullYear(), now.getMonth() + 1, 0 ).getDate()

	html = ''

	html += '<ul class="calendar_ul">'
	cnt = 1
	d_flag = false
	for j in [1..7]
		if ((wday + 1 == j) && d_flag == false) || d_flag == true
			if today == cnt
				html += '<li class="calendar_day"><div class="calendar_base_style calendar_today">' + cnt + '</div></li>'
			else
				html += '<li class="calendar_day"><div class="calendar_base_style">' + cnt + '</div></li>'
			cnt += 1
			if !d_flag
				d_flag = true
		else
			html += '<li class="calendar_blank"></li>'
	html += '</ul>'

	for i in [1..5]
		html += '<ul class="calendar_ul">'
		for j in [1..7]
			if days >= cnt
				if today == cnt
					html += '<li class="calendar_day"><div class="calendar_base_style calendar_today">' + cnt + '</div></li>'
				else
					html += '<li class="calendar_day"><div class="calendar_base_style">' + cnt + '</div></li>'
				cnt += 1
			else
				html += '<li class="calendar_blank"></li>'
		html += '</ul>'

	$("#content").html(html)
