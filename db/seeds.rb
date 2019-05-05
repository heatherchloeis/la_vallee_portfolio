User.create!(name: "Carlie La Vallee",
						 email: "c_lavallee@live.com",
						 password: "cretillia",
						 password_confirmation: "cretillia",
						 title: "3D Lighting Artist",
						 bio: "This is Carlie La Vallee's website, and this is a small bio about her. She is an indigenious artist from Saskatchewana and currently a Lighting Tech Artist with Icon Creative Studios where she's already worked on a lot of big animation projects. Her experience includes working on shows with large companies such as Disney and Netflix. That doesn't give you the whole story, but if you want more details you can check out the rest of her portfolio.")

Education.create!(school: "Art Institue, Vancouver",
									year: "2012 - 2014",
									degree: "BA",
									major: "3D Modeling in Animation and Gaming")

Experience.create!(company: "Icon Creative Studios",
									 location: "Vancouver",
									 title: "Lighting TD and Compositing Artist",
									 year: "2014 - PRESENT",
									 desc: "&nbsp;&nbsp;&nbsp;&nbsp;Projects:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Disney’s Goldie and Bear Season 1 and 2
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Disney's Elena Princess of Avalor
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Netflix Original Series: Super Monsters
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Nexflix Original Series: Kong: King of Apes
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Nexflix Original Series: Tarzan and Jane

&nbsp;&nbsp;&nbsp;&nbsp;Responsibilities:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Lighting and compositing shots and sequences over the course of several seasons
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Optimizing and troubleshooting scenes effectively, and working with other department heads to find solutions
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Presenting work professionally to Leads and Supervisors, and efficiently turning around internal and client revisions
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Communicating well with other Artists, Production, Leads and Supervisors, as well as occasionally taking over leadership roles
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Able to easily integrate into new production teams mid-project, and manage tasks across multiple productions simultaneously")

5.times do |i|
	example = Example.create(
		category: 'image'
	)
	example.content.attach(
		io: File.open('app/assets/images/image' + (i + 1).to_s + '.jpg'),
		filename: 'image' + (i + 1).to_s + '.jpg',
		content_type: 'image/jpg'
	)
end

2.times do |i|
	example = Example.create(
		category: 'video'
	)
	example.content.attach(
		io: File.open('app/assets/videos/video' + (i + 1).to_s + '.mp4'),
		filename: 'video' + (i + 1).to_s + '.mp4',
		content_type: 'video/mp4'
	)
end

10.times do |i|
	example = Example.create(
		category: 'image'
	)
	example.content.attach(
		io: File.open('app/assets/images/image' + (i + 6).to_s + '.jpg'),
		filename: 'image' + (i + 6).to_s + '.jpg',
		content_type: 'image/jpg'
	)
end

highlight_one = Example.create!(category: 'video')
highlight_one.content.attach(
		io: File.open('app/assets/videos/highlight_reel1.mp4'),
		filename: 'highlight_reel1.mp4',
		content_type: 'video/mp4'
)

5.times do |i|
	example = Example.create(
		category: 'image'
	)
	example.content.attach(
		io: File.open('app/assets/images/image' + (i + 16).to_s + '.jpg'),
		filename: 'image' + (i + 16).to_s + '.jpg',
		content_type: 'image/jpg'
	)
end

highlight_two = Example.create!(category: 'video')
highlight_two.content.attach(
		io: File.open('app/assets/videos/highlight_reel2.mp4'),
		filename: 'highlight_reel2.mp4',
		content_type: 'video/mp4'
)

5.times do |i|
	example = Example.create(
		category: 'image'
	)
	example.content.attach(
		io: File.open('app/assets/images/image' + (i + 21).to_s + '.jpg'),
		filename: 'image' + (i + 21).to_s + '.jpg',
		content_type: 'image/jpg'
	)
end

video_three = Example.create!(category: 'video')
video_three.content.attach(
		io: File.open('app/assets/videos/video3.mp4'),
		filename: 'video3.mp4',
		content_type: 'video/mp4'
)