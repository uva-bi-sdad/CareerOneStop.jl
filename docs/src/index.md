# CareerOneStop

> CareerOneStop is the flagship career, training, and job search website for the U.S. Department of Labor. The website serves job seekers, businesses, students, and career advisors with a variety of free online tools, information and resources.

It includes information such as:

- Certifications (e.g., name, organization, description)
- Licenses (i.e., [Analyst Resource Center (ARC)](https://widcenter.org/document/license/))
- Occupation data (i.e., [Occupational Information Network (O*NET)](https://www.onetonline.org/))
- Job Openings (by area from the [National Labor Exchange](https://usnlx.com/))
- Salaries (e.g., per occupation and location from the [Bureau of Labor Statistics](https://www.bls.gov/))
- Skill Gaps between Occupations

and much more through their [API](https://www.careeronestop.org/Developers/WebAPI/web-api.aspx).

In order to access the data, one must obtain valid credentials after requesting a license to the data (this is free). Fill out the request form [here](https://www.careeronestop.org/Developers/WebAPI/registration.aspx). You will then receive a userID and an API Token. You can use these to access the API.

!!! tip
    
    Try it out first using the [API Explorer](https://api.careeronestop.org/api-explorer/).

![Explorer](https://raw.githubusercontent.com/uva-bi-sdad/CareerOneStop.jl/main/docs/src/assets/img/api_explorer.png)

![Query](https://raw.githubusercontent.com/uva-bi-sdad/CareerOneStop.jl/main/docs/src/assets/img/query.png)

![Result](https://raw.githubusercontent.com/uva-bi-sdad/CareerOneStop.jl/main/docs/src/assets/img/result.png)

This package provides functionality to easily interact and collect data from the API.
