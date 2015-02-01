# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.onload = () ->

	now = new Date()
	days = new Date(now.getFullYear(), now.getMonth() + 1, 0).getDate()
	today = now.getDate()
	wday = new Date( now.getFullYear(), now.getMonth(), 1 ).getDay()
	lastDay = new Date( now.getFullYear(), now.getMonth() + 1, 0 ).getDate()

	html = ''

	cnt = 1
	d_flag = false
	ul_start_html = '<ul class="calendar_ul">'
	ul_end_html = '</ul>'
	li_normal_html = '<li class="calendar_day">'
	li_today_html = '<li class="calendar_day calendar_today">'
	li_blank_html = '<li class="calendar_blank">'
	li_end_html = '</li>'

	html += ul_start_html
	for i in [1..7]
		if ((wday + 1 == i) && d_flag == false) || d_flag == true
			if today == cnt
				html += (li_today_html + cnt + li_end_html)
			else
				html += (li_normal_html + cnt + li_end_html)
			cnt += 1
			if !d_flag
				d_flag = true
		else
			html += (li_blank_html + li_end_html)
	html += ul_end_html

	for i in [1..5]
		html += ul_start_html
 	for j in [1..7]
			if days >= cnt
				if today == cnt
					html += (li_today_html + cnt + li_end_html)
				else
					html += (li_normal_html + cnt + li_end_html)
					cnt += 1
			else
				html += (li_blank_html + li_end_html)
		html += ul_end_html

	$("#content").html(html)
