bikes_df=read.csv('Bluebikes_assignment.csv', sep=',', header=TRUE)
head(bikes_df,2)


#Start Station - Washington St at Rutland St
#End Station -  MIT at Mass Ave / Amherst St



was_freq=bikes_df %>%
  select(start.station.name,month,date,hour) %>%
  dplyr::filter(start.station.name=='Washington St at Rutland St' & hour==10) %>%
  group_by(month,date,hour) %>%
  summarise(count=n()) %>%
  group_by(count) %>%
  summarise(num_days=n()) %>%
  mutate(pickuppmf=num_days/(sum(num_days))) %>%
  mutate(pickupcmf=cumsum(pickuppmf))

was_freq

weighted.mean(was_freq$count,was_freq$pickuppmf)

ggplot(was_freq,aes(count,pickuppmf)) +
  geom_bar(stat="identity", fill ="steelblue") +
  labs(y='Pickup PMF Probability')+
  scale_x_continuous("Washington St Pickup", labels=as.character(was_freq$count)
                     , breaks=was_freq$count)

ggplot(was_freq,aes(count,pickupcmf)) +
  geom_bar(stat="identity", fill ="steelblue") +
  labs(y='Pickup CDF Probability')+
  scale_x_continuous("Washington St Pickup", labels=as.character(was_freq$count)
                     , breaks=was_freq$count)




mit_freq=bikes_df %>%
  select(end.station.name,month,date,hour) %>%
  dplyr::filter(end.station.name=='MIT at Mass Ave / Amherst St' & hour==11) %>%
  group_by(month,date,hour) %>%
  summarise(count=n()) %>%
  group_by(count) %>%
  summarise(num_days=n()) %>%
  mutate(droppmf=num_days/(sum(num_days))) %>%
  mutate(dropcmf=cumsum(droppmf))

mit_freq
saassa
weighted.mean(mit_freq$count,mit_freq$droppmf)

ggplot(mit_freq,aes(count,droppmf)) +
  geom_bar(stat="identity", fill ="steelblue") +
  labs(y='Drop PMF Probability')+
  scale_x_continuous("MIT Drop", labels=as.character(mit_freq$count)
                     , breaks=mit_freq$count)


ggplot(mit_freq,aes(count,dropcmf)) +
  geom_bar(stat="identity", fill ="steelblue") +
  labs(y='Drop CDF Probability')+
  scale_x_continuous("MIT Drop", labels=as.character(mit_freq$count)
                     , breaks=mit_freq$count)


joint_freq=outer(was_freq$num_days,mit_freq$num_days, FUN= '+')
rownames(joint_freq) = was_freq$count
colnames(joint_freq) = mit_freq$count

joint_freq

joint_prob=round(joint_freq/sum(joint_freq),3)
joint_prob

joint_df=melt(joint_freq)
joint_df

colnames(joint_df)=c('Washington_St_Pickup','MIT_Drop','Frequency')
joint_df

ggplot(data=joint_df,aes(x=Washington_St_Pickup,y=MIT_Drop))+
  geom_point(aes(size=Frequency,color=Frequency))+
  scale_x_continuous("Washington_St_Pickup",labels=as.character(joint_df$Washington_St_Pickup),breaks=joint_df$Washington_St_Pickup)+
  scale_y_continuous("MIT_Drop",labels=as.character(joint_df$MIT_Drop),breaks=joint_df$MIT_Drop)

was_8 <- bikes_df %>%
  select(start.station.name, month, date, hour) %>%
  dplyr::filter(start.station.name == 'Washington St at Rutland St') %>%
  group_by(month = month, date) %>%
  summarise(count1 = n())

was_8

dim(was_8)

# data frame for the MIT station
mit_8 <- bikes_df %>%
  select(end.station.name, month, date, hour) %>%
  dplyr::filter(end.station.name == 'MIT at Mass Ave / Amherst St') %>%
  group_by(month = month, date) %>%
  summarise(count2 = n())

mit_8

# calculating the coefficient
cor(was_8$count1[0:100], mit_8$count2[0:100])


