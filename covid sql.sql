--data source: ourworldindata.org
--dataset: coronavirus dataset



select location,date, population,(total_cases/population)*100 as 'totalCovidCases%',(total_deaths/population)*100 as 'totaldeathcases%',
(reproduction_rate/population)*100 as 'totalreproduction rate%'
from CovidDeath


select top (5) location,date, population,(total_cases/population)*100 as 'totalCovidCases%',(total_deaths/population)*100 as 'totaldeathcases%',
(reproduction_rate/population)*100 as 'totalreproduction rate%'
from CovidDeath
order by 'totalCovidCases%' desc,'totaldeathcases%' desc,'totalreproduction rate%' desc

select continent, sum(population) as 'total population',sum(cast(total_cases as float)) as 'sum of total covid cases',
sum(cast(total_deaths as float)) as 'sum of total death',
sum(cast(reproduction_rate as float)) as 'sum of reproduction rate'
from CovidDeath
where continent is not null
group by continent
order by 'sum of total covid cases' desc,'sum of total death'desc,'sum of reproduction rate' desc


select top(10) date, sum(population) as 'total population',sum(cast(total_cases as float)) as 'sum of total covid cases',
sum(cast(total_deaths as float)) as 'sum of total death',
sum(cast(reproduction_rate as float)) as 'sum of reproduction rate'
from CovidDeath
where continent is not null
group by date
order by 'sum of total covid cases' desc,'sum of total death'desc,'sum of reproduction rate' desc



select top(20) continent,location, sum(cast(population as float)) as population,sum(cast(total_cases as float)) as total_covid_cases,
sum(cast(total_deaths as float)) as total_deaths,
sum(cast(icu_patients as float)) as icu_patients,sum(cast(hosp_patients as float)) as hosp_patients
from CovidDeath
where continent is not null
group by continent,location
order by total_covid_cases desc,total_deaths desc,icu_patients desc,hosp_patients desc



select top (25) dea.continent,vac.location, sum(cast(vac.total_tests as float)) as total_tests,sum(cast(vac.positive_rate as float)) as total_covid_positive,
sum(cast(vac.total_vaccinations as float)) as total_vaccination,sum(cast(dea.total_cases as float)) as total_covid_Cases,sum(cast(dea.hosp_patients as float)) as hosp_patients,
sum(cast(dea.icu_patients as float)) as icu_patients,sum(cast(dea.reproduction_rate as float)) as reproduction_Rate,sum(cast(dea.total_deaths as float)) as total_death
from covidVaccination vac
inner join CovidDeath dea
	on vac.location= dea.location
group by dea.continent,vac.location
order by total_tests desc,total_covid_cases desc,icu_patients desc,hosp_patients desc,total_death







