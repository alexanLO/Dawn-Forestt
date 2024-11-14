extends Control
class_name Inventory

@export var slot_container: GridContainer

var current_state: String

#Basicamente, esses planos a gente está criando aqui para lidar com os itens.
#Quando a gente tiver um inventário funcional, por exemplo, a gente ter algum item, a gente tem que
#abrir o inventário. Então, ter a animação de abra o inventário ou o clique, ele vai variar baseado nisso.
#Ou então nós só vamos poder clicar se a gente vê dentro do slot de algum dos itens e aqueles lotes tiver
#um item, entre outras coisas.
var can_click: bool
var is_visible: bool

var item_index: int

#Essas 2 lista vai ser usada uma para popular os itens e a outra vai ser ultilizada para a serialização dos dados
#Quando a gente chega na parte de serviço ou de dados que a gente vai e#star salvando e carregando as
#informações do nosso jogo, a gente vai precisar de uma lista auxiliar, porque essa essa lista auxiliar.
#Ela vai conter todas as informações que nós vamos estar salvando e carregando.
#E é por meio dessa lista auxiliar que nós vamos enviar para a nossa lista em run time em tempo real,
#os itens atuais.
var slot_item_info: Array = [
	"", "", "", "", "", "", "", "", "", "",
	"", "", "", "", "", "", "", "", "", "",
	"", "", "", "", "", "", "", 
]
var slot_list: Array = [
	"", "", "", "", "", "", "", "", "", "",
	"", "", "", "", "", "", "", "", "", "",
	"", "", "", "", "", "", "", 
]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for children in slot_container.get_children():
		children.connect("empty_slot", Callable(self, "empty_slot"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func empty_slot(index: int) -> void:
	slot_list[index] = ""
	slot_item_info[index] = ""
