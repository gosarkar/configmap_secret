def secretFile = args[0]
def user = args[1]
def password = args[2]

println 'secret file: '+secretFile
println 'user: '+user+' password: '+password

updateSecretFile(secretFile, user, password)

def updateSecretFile(secretFile, user, password){
	
	def encodedUser = user.bytes.encodeBase64().toString()
	def encodedPassword = password.bytes.encodeBase64().toString()
	def str = new File(secretFile).text
	str = str.replace('USERNAME', encodedUser)
	str = str.replace('PASSWORD', encodedPassword)
	println '==>>'+str
	
	def mySecretFile = new File(secretFile)
	mySecretFile.write('')
	mySecretFile << str
	
	println 'encoded user = '+encodedUser
	println 'encoded password = '+encodedPassword
	
}
