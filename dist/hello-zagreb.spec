Name:           hello-zagreb
Version:        1
Release:        0
Summary:        Hello World application for Open System Days 2018 
License:        GPL-2.0+
Group:          Development/Tools/Building
Url:            https://github.com/ChrisBr/hello-fosdem
Source:         %{name}-%{version}.tar.xz
Requires:  	ruby
BuildRoot:      %{_tmppath}/%{name}-%{version}-build
BuildArch:      noarch

%description
Hello world application for Open System Days 2018 to demonstrate
the functionality of the Open Build Service

%prep
%setup -q

%build

%install
mkdir -p %{buildroot}%{_bindir}
install -m 755 %{name} %{buildroot}%{_bindir}/%{name}


%files
%defattr(-,root,root)
%attr(755,root,root) %{_bindir}/%{name}

%changelog
