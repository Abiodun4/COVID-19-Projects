select*
from PortfolioProject2..COVIDdata
where continent is not null
order by 3,4


--Select location, SUM(cast(new_deaths as int)) as TotalDeathCount, max(cast(total_deaths as int)) as TotalDeathCounts
--From PortfolioProject2..COVIDdata
----Where location like '%states%'
--Where continent is not null and new_deaths != ' '
--Group by location
--order by TotalDeathCount desc

--Select location, max(cast(total_deaths as int)) as TotalDeathCounts
--From PortfolioProject2..COVIDdata
----Where location like '%states%'
--Where continent is not null
--Group by location
--order by TotalDeathCounts desc



--  Overall percentage death and population infected

Select continent as Continent, Location as Country, Population as Population, MAX(total_cases) as HighestInfectionCount, max(cast(total_deaths as int)) as TotalDeathCount,
Max(cast(total_deaths as int)/population)*100 as PercentPopulationDead,Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject2..CovidData
--Where location like '%states%'
Where continent is not null and total_cases != ' ' and total_deaths != ' '
Group by Location, continent, Population
order by PercentPopulationDead desc


-- Daily percentage death and population infected


Select Location as Country, Population as Population, MAX(total_cases) as HighestInfectionCount, max(cast(total_deaths as int)) as TotalDeathCount,
Max(cast(total_deaths as int)/population)*100 as PercentPopulationDead,Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject2..CovidData
--Where location like '%afgh%' and total_deaths is not null and total_cases is not null
Group by Location, Population
order by PercentPopulationInfected desc



-- People fully vaccinated vs People vaccinated

select Location as Country, population as Population, max(people_vaccinated) as PeopleVaccinated, max(people_fully_vaccinated) as PeopleFullyVaccinated,
(Max(people_vaccinated)/population)*100 as PercentPeopleVaccinated, (Max(people_fully_vaccinated)/population)*100 as PercentPeopleFullyVaccinated
from PortfolioProject2..COVIDdata
where people_vaccinated is not null and people_fully_vaccinated is not null and population is not null
Group by location, population
order by PercentPeopleFullyVaccinated desc

-- Weekly Hospital Admissions by date
select date as Date, continent as Continent, location as Country, sum(cast(weekly_hosp_admissions as int)) as WeeklyHospitalAdmissions
from PortfolioProject2..COVIDdata
where weekly_hosp_admissions is not null and continent is not null and location is not null
group by continent, date, location
order by location

-- Total Weekly Hospital Admissions
select continent as Continent, location as Country, sum(cast(weekly_hosp_admissions as int)) as WeeklyHospitalAdmissions
from PortfolioProject2..COVIDdata
where weekly_hosp_admissions is not null and continent is not null
group by continent, location
order by location

---- Total Weekly Hospital Admissions Confirmation
--select location as Country, sum(cast(weekly_hosp_admissions as int)) as WeeklyHospitalAdmissions
--from PortfolioProject2..COVIDdata
--where weekly_hosp_admissions is not null and location is not null
--group by location
--order by location


