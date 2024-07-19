using {kaztakata as my} from '../db/schema';

service UserService {
  entity Documents as projection on my.Documents
  entity Items as projection on my.Items
};