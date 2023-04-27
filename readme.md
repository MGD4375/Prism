# Prism

This is a fictional project called Prism, which has two web services. 
- Cerulean.Web
- Vermillion.Web

The goal was to use Azure Front Door to combine access to both. For example, if we give our front door the domain: prism.com

https://prism.com/cerulean -> Cerulean.Web

https://prism.com/vermillion -> Vermillion.Web

---

I was successful insofar as those routes work. Where it fell down is that cerulean did a load of it's routing on the basis of '/' being the base url. Because requests to '/' were routing back to prism, scripts and styles failed to be delivered.