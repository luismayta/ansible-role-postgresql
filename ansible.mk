# Ansible
.PHONY: ansible.help
USER:=ubuntu
ANSIBLE_DIR:=$(PROVISION_DIR)/ansible

ansible.help: 
	@echo '    Ansible:'
	@echo ''
	@echo '        ansible.encrypt            encrypt by store'
	@echo '        ansible.decrypt            decrypt by store'
	@echo '        ansible.update             Update Roles ansible by store'
	@echo '        ansible.provision          Provision servers by store'
	@echo '        ansible.deploy             Deploy dependences by store'
	@echo '        ansible.tag                Deploy tag by store'
	@echo ''

ansible.encrypt: clean
	@ansible-vault encrypt "${ANSIBLE_DIR}/${store}/vars/vars.yaml" \
		--vault-password-file "${HOME}/${PROJECT}-${store}.txt" && echo $(MESSAGE_HAPPY)

ansible.decrypt: clean
	@ansible-vault decrypt "${ANSIBLE_DIR}/${store}/vars/vars.yaml" \
		--vault-password-file "${HOME}/${PROJECT}-${store}.txt" && echo $(MESSAGE_HAPPY)

ansible.update: clean
	@ansible-galaxy install -r "${ANSIBLE_DIR}/${store}/"requirements.yml \
			   --roles-path "${ANSIBLE_DIR}/${store}"/roles/contrib --force

ansible.provision: clean ansible.update
	@ansible-playbook -vvvv "${ANSIBLE_DIR}/${store}/provision.yaml" -i "${ANSIBLE_DIR}/${store}/inventories/aws"  -v \
					--user="${USER}"  --private-key="${KEYS_DIR}/${PROJECT}-${store}.pem" \
					--extra-vars "@${ANSIBLE_DIR}/${store}/vars/vars.yaml" \
					--vault-password-file "${HOME}/${PROJECT}-${store}.txt"

ansible.deploy: clean ansible.update
	@ansible-playbook -vv "${ANSIBLE_DIR}/${store}/deploy.yaml" -i "${ANSIBLE_DIR}/${store}/inventories/aws"  -v \
					--user="${USER}"  --private-key="${KEYS_DIR}/${PROJECT}-${store}.pem" \
					--extra-vars "@${ANSIBLE_DIR}/${store}/vars/vars.yaml" \
					--vault-password-file "${HOME}/${PROJECT}-${store}.txt"


ansible.tag: clean ansible.update
	@ansible-playbook -vv "${ANSIBLE_DIR}/${store}/deploy.yaml" -i "${ANSIBLE_DIR}/${store}/inventories/aws"  -v \
					--user="${USER}"  --private-key="${KEYS_DIR}/${PROJECT}-${store}.pem" \
					--tags "${tags}" \
					--extra-vars "@${ANSIBLE_DIR}/${store}/vars/vars.yaml" \
					--vault-password-file "${HOME}/${PROJECT}-${store}.txt"
